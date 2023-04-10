# **rust-on-lambda**

This example demonstrates how to deploy a containerized [`axum`](https://github.com/tokio-rs/axum) application to an AWS Lambda function with an image size under **`1MB`**. The application is built **`FROM scratch`** to minimize the overall cold start time and considers interoperability between a normal web server (`debug` mode) and a lambda application (`release` mode).

<br />

![image](./assets/image.png)
