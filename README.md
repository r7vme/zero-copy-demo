# Zero-copy Demo

This repo demonstrates [zero-copy feature](https://design.ros2.org/articles/zero_copy.html) of ROS 2 Galactic.

## Usage

Install [ade cli](https://ade-cli.readthedocs.io/en/latest/index.html). ADE uses docker, please make sure that docker is installed.

```bash
cd /tmp
wget https://gitlab.com/ApexAI/ade-cli/-/jobs/1341322851/artifacts/raw/dist/ade+x86_64 -O ade
chmod +x ade
sudo mv ade /usr/local/bin
```

Build demo environment (docker image)

```bash
git clone https://github.com/r7vme/zero-copy-demo
cd zero-copy-demo
docker build -t zero-copy-demo .
```

Start demo environment (docker container)

```bash
ade start --enter
```

Build demo source code (run from with-in ADE demo environment)

```bash
ade $ ./build.sh
```

Finally run the demo:

1. Without zero-copy `./run.sh`
1. With zero-copy `./run.sh --zero-copy`
