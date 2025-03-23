#!/bin/bash
apt-get update
apt-get install -y apache2 curl

# Get metadata values
PROJECT_ID=$(curl -H "Metadata-Flavor: Google" \
http://metadata.google.internal/computeMetadata/v1/project/project-id)

VPC_NAME=$(curl -H "Metadata-Flavor: Google" \
http://metadata.google.internal/computeMetadata/v1/instance/attributes/VPC_NAME)

PRIVATE_IP=$(curl -H "Metadata-Flavor: Google" \
http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/ip)

# Download mascot image
wget -O /var/www/html/mascot.jpg "https://upload.wikimedia.org/wikipedia/en/thumb/8/8d/USNA_seal.png/200px-USNA_seal.png"

# Create HTML file
cat <<EOF > /var/www/html/index.html
<html>
  <head>
    <title>Brazilian GCP Server</title>
    <style>
      body {
        background-image: url('https://img.freepik.com/premium-photo/flag-wallpaper-brazil_670382-35283.jpg');
        background-size: cover;
        color: white;
        font-family: Arial, sans-serif;
        text-align: center;
        padding: 20px;
      }
      .content {
        background-color: rgba(0,0,0,0.5);
        padding: 20px;
        border-radius: 10px;
        display: inline-block;
      }
      img {
        border-radius: 10px;
        margin: 10px;
      }
    </style>
  </head>
  <body>
    <div class="content">
      <h1>Welcome to the Web Server</h1>
      <img src="https://www.sanclerfrantz.com.br/extranet/gallery/50.jpg" alt="Theo's Blonde" width="527" height="791">
      <p><strong>Project ID:</strong> $PROJECT_ID</p>
      <p><strong>VPC Name:</strong> $VPC_NAME</p>
      <p><strong>Private IP:</strong> $PRIVATE_IP</p>
      <img src="https://colorsuper.com/cdn/shop/files/Colorsuper-Bikini-Low-Rise-Super-Bikini-Visual-Nitro-Pink-Green-Yellow-001.jpg?v=1710810748&width=1400" alt="TIQS Afro-Braziliana" width="633" height="791">
    </div>
  </body>
</html>
EOF

# Restart web server
systemctl restart apache2