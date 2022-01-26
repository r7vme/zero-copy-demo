# Zero-copy Demo

This repo demonstrates [zero-copy feature](https://design.ros2.org/articles/zero_copy.html) of ROS 2 Galactic.

Demo supports two regimes: with and without zero-copy. When running with
zero copy there should be a significantly smaller latency (2ms vs 40ms)
and increased frames per second.

DISCLAIMER: This demo intended to only demonstrate a specific use case, where zero-copy can be used.
For objective measurements of middleware performance, use [performance_test](https://gitlab.com/ApexAI/performance_test).

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

IMPORTANT: All commands below should be run from with-in ADE.

Build demo source code

```bash
./build.sh
```

Download any Full HD video (1920 x 1080) as `video.mp4` to current folder.
For example, [this](https://www.pexels.com/video/traffic-flow-in-the-highway-2103099/) video can be used.

Finally run the demo:

1. Without zero-copy `./run.sh`
1. With zero-copy `./run.sh --zero-copy`

To stop the demo. In new terminal run

```bash
cd zero-copy-demo
ade enter
tmux kill-session -t demo
```

To stop ADE environment (docker container)

```bash
cd zero-copy-demo
ade stop
```
