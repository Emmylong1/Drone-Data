resource "aws_kinesis_stream" "drone_stream" {
  name             = var.stream_name
  shard_count      = var.shard_count
  retention_period = var.retention_period
}

resource "aws_kinesis_stream_consumer" "drone_consumer" {
  name             = "${var.stream_name}-consumer"
  stream_arn       = aws_kinesis_stream.drone_stream.arn
}
