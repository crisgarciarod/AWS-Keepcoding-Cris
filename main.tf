#LIBRERIA

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}


#PROVIDER
provider "aws" {
  region = var.region #"eu-west-1"
}


#BUCKET
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket  
}

#WEBSITE ESTATICO

resource "aws_s3_bucket_website_configuration" "websitestatic" {
  bucket = aws_s3_bucket.bucket.id   

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

#ACL
resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.policy_enabled ? "private" : "public-read"
}


#OBJECTS
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.bucket.id
  key    = "index.html"
  source = "static_resources/index.html"
  content_type = "text/html"
  acl = var.policy_enabled ? "private" : "public-read"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.bucket.id
  key    = "error.html"
  source = "static_resources/error.html"
  content_type = "text/html"
  acl = var.policy_enabled ? "private" : "public-read"
}

#POLICY
resource "aws_s3_bucket_policy" "bucket_policy" {
  count = var.policy_enabled ? 1 : 0

  bucket = aws_s3_bucket.bucket.id
  
  policy =<<POLICY
  {
     "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "PublicReadGetObject",
              "Effect": "Allow",
              "Principal": "*",
              "Action": [
                  "s3:GetObject"
              ],
              "Resource": [
                  "arn:aws:s3:::myprojectaws/*"
              ]
          }
      ]
  }
POLICY
}