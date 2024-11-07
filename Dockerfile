FROM ubuntu:20.04

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y build-essential cmake git gdb

# Install Google Test
RUN apt-get install -y libgtest-dev && cd /usr/src/gtest && cmake . && make && cp lib/*.a /usr/lib

# Copy source files
COPY . /app
WORKDIR /app

# Build the application and tests
RUN g++ -g -O0 -o main main.cpp add.cpp
RUN g++ -g -O0 -o test_main tests/test_main.cpp add.cpp -lgtest -lgtest_main -pthread


# Default command to run the application and redirect output to a log file
CMD ["sh", "-c", "./main > /app/main.log 2>&1"]