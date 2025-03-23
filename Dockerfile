# Sử dụng hình ảnh Ubuntu làm cơ sở
FROM ubuntu:20.04

# Cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    gnupg \
    tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update && apt-get install -y google-chrome-stable \
    && apt-get install -y chromium-chromedriver \
    && apt-get clean

# Cài đặt Python và pip
RUN apt-get install -y python3 python3-pip

# Sao chép tệp requirements.txt vào container
COPY requirements.txt .

# Cài đặt các thư viện Python từ requirements.txt
RUN pip3 install -r requirements.txt

# Sao chép mã nguồn vào container
COPY . /app
WORKDIR /app

# Chạy ứng dụng
CMD ["python3", "app.py"]
