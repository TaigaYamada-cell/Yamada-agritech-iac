resource "aws_iot_thing" "thing" {
  name = var.thing_name
}

resource "aws_iot_policy" "policy" {
  name   = "${var.thing_name}-policy"
  policy = data.aws_iam_policy_document.iot_policy.json
}

data "aws_iam_policy_document" "iot_policy" {
  statement {
    actions = [
      "iot:Connect",
      "iot:Publish",
      "iot:Receive",
      "iot:Subscribe"
    ]
    resources = ["*"]
  }
}

resource "aws_iot_certificate" "cert" {
  active = true
}

resource "aws_iot_policy_attachment" "attach" {
  policy = aws_iot_policy.policy.name
  target = aws_iot_certificate.cert.arn
}

resource "aws_iot_thing_principal_attachment" "thing_attach" {
  thing     = aws_iot_thing.thing.name
  principal = aws_iot_certificate.cert.arn
}

data "aws_iot_endpoint" "endpoint" {
  endpoint_type = "iot:Data-ATS"
}
