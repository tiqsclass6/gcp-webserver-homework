# 🌐 GCP Web Server Deployment – Week 2 Homework

This project deploys a GCP VM running a web server inside a custom VPC using Terraform. The web page displays your project metadata (Project ID, VPC name, Private IP), and includes mascot images and a Brazilian-themed background.

---

## 🚀 Prerequisites

- A Google Cloud Project (e.g., `class-6-5-tiqs`) with billing enabled
- Google Cloud SDK installed
- Terraform installed
- Permissions to create networks, subnets, VMs, and firewall rules
- Run the following to authenticate Terraform:

```bash
gcloud auth application-default login
```

---

## 📁 Project Structure

| File                  | Description                                |
|-----------------------|--------------------------------------------|
| `1-providers.tf`      | Google Cloud provider and project config   |
| `2-variables.tf`      | Declares variables (region, subnets, etc.) |
| `3-vpc.tf`            | Creates a custom VPC                       |
| `4-subnets.tf`        | Creates public and private subnets         |
| `5-vm-instances.tf`   | Deploys VM with HTTP access and metadata   |
| `6-outputs.tf`        | Outputs the external IP of the VM          |
| `startup-script.sh`   | Installs Apache and generates HTML page    |

---

## 🛠️ Step-by-Step Deployment

### 1. **Set the Active GCP Project**

```bash
gcloud config set project class-6-5-tiqs
```

---

### 2. **Enable Required APIs**

```bash
gcloud services enable compute.googleapis.com
```

---

### 3. **Initialize Terraform**

```bash
terraform init
```

---

### 4. **Format Terraform**

```bash
terraform fmt
```

---

### 5. **Validate Terraform**

```bash
terraform validate
```

---

### 6. **Deploy Infrastructure**

```bash
terraform apply
```

Type `yes` when prompted.

---

### 7. **View the Web Server**

After deployment, Terraform outputs the public IP:

```hcl
web_server_public_ip = "EXTERNAL_IP"
```

Open it in your browser:

```text
http://EXTERNAL_IP
```

You’ll see:

- A styled page with your **Project ID**, **VPC Name**, and **Private IP**
- Two themed mascot images
- A Brazilian flag background

---

## 🧪 Script Behavior

The `startup-script.sh`:

- Installs Apache
- Downloads a mascot image
- Creates a styled HTML page
- Dynamically pulls:
  - `Project ID`: via GCP metadata server
  - `Private IP`: from the internal network interface
  - `VPC Name`: passed via metadata attribute

Example command to get private IP:

```bash
curl -H "Metadata-Flavor: Google" \
http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/ip
```

---

## 🧼 Cleanup

To delete all resources and avoid charges:

```bash
terraform destroy
```

Confirm with `yes`.

---

## 📬 Contact

For questions or issues, please contact your instructor or teaching assistant.
