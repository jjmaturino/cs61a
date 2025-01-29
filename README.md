# Berkeley CS61a

# How to run Scheme Via Docker
1. Execute the docker image interactively
`docker run -it cs61a-scheme`

2. Run scheme in the docker container with the ucb extension loaded
`stk -load load-simply`

3. Run docker image with files associated locally iteractievly
`docker run -it -v $(pwd)/path/to/code:/code  cs61a-scheme`




# Roadmap
- Have repo be used for self study
- Repurpose repo and generalize tools used while studying to improve OS self study of CS61a
- If desired, include AI goodies to the learning process 

## Updates to Make
- Change rtk to https://stklos.net/documentation.html
- Use pkg instead of building from source

