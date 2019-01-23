resource "datadog_timeboard" "sample_11" {
  title       = "Terraform v0.11"
  description = "created using the Datadog provider in Terraform"
  read_only   = true

  graph {
    title = "ALB Response Time"
    viz   = "timeseries"
    precision = 0

    request {
      q    = "avg:aws.applicationelb.target_response_time.average{*}"
      type = "line"
      style {
        palette = "orange"
        type    = "solid"
        width   = "normal"
      }
    }

    request {
      q    = "week_before(avg:aws.applicationelb.target_response_time.average{*})"
      type = "line"
      style {
        palette = "orange"
        type    = "dotted"
        width   = "normal"
      }
    }

    request {
      q    = "avg:aws.applicationelb.target_response_time.average{*}"
      type = "line"
      style {
        palette = "cool"
        type    = "solid"
        width   = "normal"
      }
    }

    request {
      q    = "week_before(avg:aws.applicationelb.target_response_time.average{*})"
      type = "line"
      style {
        palette = "cool"
        type    = "dotted"
        width   = "normal"
      }
    }
  }
}
