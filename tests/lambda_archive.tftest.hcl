variables {
  type = "zip"
}

run "valid_archive_type" {

  command = plan

  assert {
    condition = archive_file.auth_lambda.type == "zip"

    error_message = "archive type was not as expected"
  }
}
