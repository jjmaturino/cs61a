# Berkeley CS61a


# 1. How to get Scheme Built Image

**There are two options for getting a docker image that includes the required lisp runtime**

## 1.a Building Scheme Docker Image Locally (On M1 MBP)
`docker buildx build --platform linux/amd64 -t cs61a-scheme . `

## 1.b Downloading Image from Github Container Registry (gchr.io)
`docker pull ghcr.io/jjmaturino/cs61a-scheme:latest`


# How to run Scheme Via Docker
1. Execute the docker image interactively
`docker run -it cs61a-scheme`

2. Run scheme in the docker container with the ucb extension loaded
`stk -load load-simply`

3. Run docker image with files associated locally iteractievly
`docker run -it -v $(pwd)/[/path/to/your/code]:/usr/src/app  cs61a-scheme`

4. Run stk with berkely extension (run inside of docker container)
`stk -load load-simply`




# Roadmap
- Have repo be used for self study
- Repurpose repo and generalize tools used while studying to improve OS self study of CS61a
- If desired, include AI goodies to the learning process 

## Updates to Make
- Change rtk to https://stklos.net/documentation.html
- Use pkg instead of building from source

