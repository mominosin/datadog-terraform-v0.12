variable "query_list" {
  default = [
    {
      title = "ALB Response Time 01"
      query = "avg:aws.applicationelb.target_response_time.average{*}",
      type = "solid"
    },
    {
      title = "ALB Response Time 02"
      query = "week_before(avg:aws.applicationelb.target_response_time.average{*})"
      type    = "dotted"
    },
    {
      title = "ALB Response Time 03"
      query = "avg:aws.applicationelb.target_response_time.average{*}",
      type = "solid"
    },
    {
      title = "ALB Response Time 04"
      query = "week_before(avg:aws.applicationelb.target_response_time.average{*})"
      type    = "dotted"
    },
  ]
}

resource "datadog_timeboard" "sample_12_for_each" {
  title       = "Terraform v0.12 for_each"
  description = "created using the Datadog provider in Terraform"
  read_only   = true

  dynamic "graph" {
    for_each = var.query_list
    content {
    title = var.query_list[graph.key].title
    viz   = "timeseries"
    precision = 0

    request {
      q    = var.query_list[graph.key].query
      type = "line"
      style = {
        palette = "orange"
        type    =  var.query_list[graph.key].type
        width   = "normal"
      }
    }
    }
  }
}
