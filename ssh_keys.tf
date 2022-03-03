# Public Key for accessing EC2 instances

resource "aws_key_pair" "user_key" {
  key_name   = "user-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5PcvlG+/CdPKwiGirz0nHFetCcQBv3WGHuJ8ETcOwj4e88I2PAHB+PCB6kEDVJ6gf8E3XDBPV/C1WA4BhrTM+ksj1veroakfcjbC7i2JbwInlDwXCCD48u6dapQxyFf5I0PfB7V31xtDzvwnRatmgyw7huGSskaP36PKsMoEdOCbHt1nBHpzCujb8qSfr4biQiEau7ZPra/8EF+51TdqoprBB0bx+vTVez7hIjK0qv3MgMG1AdtCn4VzpNSgCXTaszJSLi/tOa9nT9rnweZNzQ0BrpfPrHcFqodI/Ec0h5ukaCZvgfX/USj9dSYMTB+24OXdiRKKJsZ+Q2vAAlOHUU1kn2edokOxIvPrbhjo2/5Ma1VgoYUDagdGW0QPudn8Kk5VfuUA2S/cXrZZDKzzsx1VHY9eX+DAd1rDSR1yhoxVXTkYlGyXSclweqSf1WF8GnvK40gHXvLyfBM6Jqh50ASG9yNVGvI0pQG3ZNg+UcbWw8S8cLipdegLEOQuJQmU="

  tags = {
    Name = "first-name_last-name"
  }
}
