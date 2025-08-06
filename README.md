💡 How powerful and efficient Terraform can be!

⚙️ Within minutes, I was able to provision AWS resources using Infrastructure as Code (IaC).
I structured my code to easily support multiple environments and regions.

🔐 To keep things secure and manageable:

Defined variables in a variables.tf file

Passed actual values through a Values.tfvars file

This helped me secure AWS credentials and sensitive data, while keeping the code clean and reusable.

📁 You can see all the important Terraform files in my local setup – including main.tf, variables.tf, values.tfvars, and .gitignore.

<img width="657" height="340" alt="image" src="https://github.com/user-attachments/assets/503ceb47-8f16-485e-9a27-a41d24a0010a" />



🛡️ .gitignore matters!
Your .gitignore file should be committed and pushed to GitHub so your team knows what not to track. Especially:

❌ AWS credentials

❌ Terraform state files (terraform.tfstate, *.tfstate.backup)

❌ .tfvars files with secrets

❌ Plan output files (*.plan)

❌ .terraform/ init directories
