output "bucket" {
     value = aws_s3_bucket.bucket.id
 }

output "s3_bucket_website_endpoint" {
    value = aws_s3_bucket_website_configuration.websitestatic.website_endpoint
}
