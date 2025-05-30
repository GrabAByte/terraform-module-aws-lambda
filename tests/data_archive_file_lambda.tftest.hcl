run "valid_archive_type" {

  command = plan

  assert {
    condition = data.archive_file.auth_lambda.type == "zip"

    error_message = "archive type was not as expected"
  }
}

run "valid_archive_source_file" {

  command = plan

  assert {
    condition = data.archive_file.auth_lambda.source_file == "auth-lambda.py"

    error_message = "archive source file was not as expected"
  }
}

run "valid_archive_output_path" {

  command = plan

  assert {
    condition = data.archive_file.auth_lambda.output_path == "auth-lambda.zip"

    error_message = "archive output path was not as expected"
  }
}
