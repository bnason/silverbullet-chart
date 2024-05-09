# SilverBullet Helm Chart


![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.7.7](https://img.shields.io/badge/AppVersion-0.7.7-informational?style=flat-square)

A [SilverBullet](https://silverbullet.md/) chart for Kubernetes. [SilverBullet](https://silverbullet.md/) is a note-taking application optimized for people with a [hacker mindset](https://en.wikipedia.org/wiki/Hacker).

# TL;DR;

```console
helm repo add silverbullet https://bnason.github.io/silverbullet-helm
helm --namespace=silverbullet --create-namespace install silverbullet silverbullet/silverbullet
```


## Introduction

This chart deploys [SilverBullet](https://silverbullet.md/) on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

The chart supports the [SilverBullet plug for Git](https://silverbullet.md/Plugs/Git) by either checking out a user repository or a "skeleton" repository. If the user repository is specified but does not exist, the skeleton repository will be used as the first commit for the users repository.


## Installing the Chart

The chart can be installed as follows:

```console
helm repo add silverbullet https://bnason.github.io/silverbullet-helm
```

```console
helm --namespace=silverbullet --create-namespace install silverbullet silverbullet/silverbullet
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm --namespace=silverbullet --create-namespace install silverbullet silverbullet/silverbullet -f values.yaml
```

> **Tip**: You can use the default [values.yaml](/charts/silverbullet/values.yaml)


## Uninstalling the Chart

To uninstall/delete the `silverbullet` deployment:

```console
$ helm uninstall silverbullet
```

The command removes all the Kubernetes components associated with the chart and deletes the release.


## Configuration



## Values


| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admin.password | string | `""` |  |
| admin.username | string | `""` |  |
| affinity | object | `{}` |  |
| extraManifests | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| git.branch | string | `"main"` |  |
| git.email | string | `""` |  |
| git.name | string | `""` |  |
| git.repository | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"zefhemel/silverbullet"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| init.branch | string | `"main"` |  |
| init.image.pullPolicy | string | `"IfNotPresent"` |  |
| init.image.repository | string | `"ghcr.io/bnason/silverbullet-init"` |  |
| init.image.tag | string | `"main"` |  |
| init.repository | string | `""` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| resources | object | `{}` |  |
| runMode.readOnly | bool | `false` |  |
| runMode.syncOnly | bool | `false` |  |
| securityContext | object | `{}` |  |
| service.port | int | `3000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| ssh."id_rsa.pub" | string | `""` |  |
| ssh.id_rsa | string | `""` |  |
| ssh.known_hosts | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts[0].mountPath | string | `"/root/.ssh"` |  |
| volumeMounts[0].name | string | `"ssh"` |  |
| volumeMounts[0].readOnly | bool | `true` |  |
| volumes | list | `[]` |  |

See [values.yaml](/charts/silverbullet/values.yaml) for configuration notes. Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
