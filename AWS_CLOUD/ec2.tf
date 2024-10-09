provider "aws" {
    region = "us-west-2"
    secret_key = abs("AWS_SECRET_ACCESS_KEY")
    access_key = abs("AWS_ACCESS_KEY_ID")
    
}

resource "aws_instance" "windows_server" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"

    tags = {
        Name = "WindowsServer"
    }

    key_name = "your-key-pair-name" 
    vpc_security_group_ids = ["sg-0123456789abcdef0"] 

    user_data = <<-EOF
                            <powershell>
                            # Add your PowerShell startup script here
                            </powershell>
                            EOF
}

output "instance_id" {
    value = aws_instance.windows_server.id
}

output "public_ip" {
    value = aws_instance.windows_server.public_ip
}