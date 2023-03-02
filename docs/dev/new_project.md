# New project creation

###### tags: `Dev`

1. Create project skeleton (any language);
2. Create [`.gitignore`](https://www.toptal.com/developers/gitignore) file for the chosen language;
3. Initialize the project as a Git repository: [`git init`](https://git-scm.com/docs/git-init);
4. Configure project tools:
	1. Create [`.editorconfig`](https://editorconfig.org/) file. A generic file can be found [here](https://gist.github.com/BParolini/edca44bd870b09f4027339713fb64a57);
	2. Lint - language specific (spotless, flake8, bandit, etc);
	3. Security scans (Trivy, etc.);
5. Configure test suite:
	- Unit tests;
	- Integration tests;
	- Test coverage;
6. Configure monitoring tools:
	- Prometheus, Datadog, Kibana, Grafana, etc;
7. Configure `Dockerfile`:
	- Configure `.dockerignore`;
8. Configure a [`Makefile`](https://makefiletutorial.com/#getting-started):
	- Clean build directory;
	- Run lint;
	- Run test suite;
	- Run security checks;
	- Build project;
	- Build Docker image;
	- Optionals:
		- Push image to Docker Hub;
		- Image deployment (Kubernetes, etc);
9. Kubernetes deployment files:
	- deployment;
	- services;
	- HPA (horizontal pod autoscaler);
	- ingress;
10. Configure CI/CD ([GitHub Actions](https://docs.github.com/en/actions), etc.)
