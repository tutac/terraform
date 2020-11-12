resource "aws_iam_group" "developers" {
    name = "developers"
    path = "/"
}

resource "aws_iam_group" "management" {
    name = "management"
    path = "/"
}
resource "aws_iam_group" "infosec" {
    name = "infosec"
    path = "/"
}

resource "aws_iam_group_membership" "developers_team" {
  name = "developers-group-membership"
  users = [
    "${aws_iam_user.Tim.name}",
    "${aws_iam_user.Ben.name}",
    "${aws_iam_user.Bob.name}"
]
  group = "${aws_iam_group.developers.name}"
}
resource "aws_iam_group_membership" "infosec" {
  name = "infosec-group-membership"
  users = [
    "${aws_iam_user.Ron.name}",
    "${aws_iam_user.Billy.name}",
    "${aws_iam_user.Sam.name}"
]
  group = "${aws_iam_group.infosec.name}"
}


resource "aws_iam_group_membership" "management_team" {
  name = "management-group-membership"
  users = [
    "${aws_iam_user.Ben.name}"
   
  ]
  group = "${aws_iam_group.management.name}"
}