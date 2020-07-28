# clean-gke-remnants

Script to cleanup ophaned resources when gke with gce ingress controller is deleted.

For more details, see the GitHub issue:
https://github.com/kubernetes/ingress-gce/issues/136


## Installation and usage

**clean-gke-remnants** is a nix native application.

Install nix package manger and run the following command:

```console
$ nix-env -i -f https://github.com/kayhide/clean-gke-remnants/archive/master.tar.gz
```

After successful installation the **clean-gke-remnants** command is available.

```console
$ clean-gke-remnants
Usage: src/cleanup-gke-remnants COMMAND

Available commands:
  list
  delete
```


## Contributions

Feel free to open an issue or PR.
Thanks!
