# pass

resource "aws_cloudfront_distribution" "pass" {
  enabled = true

  default_cache_behavior {
    response_headers_policy_id = aws_cloudfront_response_headers_policy.pass.id
  }
  tags = {
    yor_trace = "1087ce35-fd8a-4d4f-ae62-b53814a69d86"
  }
}

resource "aws_cloudfront_response_headers_policy" "pass" {
  name = "test"

  security_headers_config {
    content_security_policy {
      content_security_policy = "default-src 'none'; img-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'; frame-ancestors 'none'"
      override                = true
    }
    content_type_options {
      override = true
    }
    frame_options {
      frame_option = "DENY"
      override     = true
    }
    referrer_policy {
      referrer_policy = "same-origin"
      override        = true
    }
    strict_transport_security {
      access_control_max_age_sec = 31536000
      include_subdomains         = true
      override                   = true
      preload                    = true
    }
    xss_protection {
      mode_block = true
      override   = true
      protection = true
    }
  }
}

# fail

resource "aws_cloudfront_distribution" "no_response_headers_policy" {
  enabled = true
  tags = {
    yor_trace = "bdd12888-1bfe-4cbf-ac94-85cf9c9171bb"
  }
}

resource "aws_cloudfront_distribution" "no_security_headers_config" {
  enabled = true

  default_cache_behavior {
    response_headers_policy_id = aws_cloudfront_response_headers_policy.no_security_headers_config.id
  }
  tags = {
    yor_trace = "149b7a14-4ac8-4608-9e4c-463180e4a4e6"
  }
}

resource "aws_cloudfront_response_headers_policy" "no_security_headers_config" {
  name = "test"
}

resource "aws_cloudfront_distribution" "incorrect_security_headers_config" {
  enabled = true

  default_cache_behavior {
    response_headers_policy_id = aws_cloudfront_response_headers_policy.incorrect_security_headers_config.id
  }
  tags = {
    yor_trace = "50f72042-32d3-4828-8638-2074daabfdc3"
  }
}

resource "aws_cloudfront_response_headers_policy" "incorrect_security_headers_config" {
  name = "test"

  security_headers_config {
    content_security_policy {
      content_security_policy = "default-src 'none'"
      override                = true
    }
    content_type_options {
      override = true
    }
    frame_options {
      frame_option = "DENY"
      override     = true
    }
    referrer_policy {
      referrer_policy = "same-origin"
      override        = true
    }
    strict_transport_security {
      access_control_max_age_sec = 31536000
      include_subdomains         = true
      override                   = true
      preload                    = true
    }
    xss_protection {
      mode_block = true
      override   = true
      protection = false
    }
  }
}

resource "aws_cloudfront_distribution" "content_security_policy_missing_default_src_none" {
  enabled = true

  default_cache_behavior {
    response_headers_policy_id = aws_cloudfront_response_headers_policy.content_security_policy_missing_default_src_none.id
  }
  tags = {
    yor_trace = "0caf25ff-4844-4f05-8267-e44a39e1ae9e"
  }
}

resource "aws_cloudfront_response_headers_policy" "content_security_policy_missing_default_src_none" {
  name = "test"

  security_headers_config {
    content_security_policy {
      content_security_policy = "default-src 'self' 'unsafe-inline' data: ws: *"
      override                = true
    }
    content_type_options {
      override = true
    }
    frame_options {
      frame_option = "DENY"
      override     = true
    }
    referrer_policy {
      referrer_policy = "same-origin"
      override        = true
    }
    strict_transport_security {
      access_control_max_age_sec = 31536000
      include_subdomains         = true
      override                   = true
      preload                    = true
    }
    xss_protection {
      mode_block = true
      override   = true
      protection = false
    }
  }
}
