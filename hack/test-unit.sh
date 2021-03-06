#!/bin/bash
source "$(dirname "${BASH_SOURCE}")/lib/init.sh"

os::log::info "Running unit tests"


PACKAGES_TO_TEST=(
    "github.com/openshift/console-operator/pkg/cmd/operator"
    "github.com/openshift/console-operator/pkg/cmd/version"
    "github.com/openshift/console-operator/pkg/console/operator"
    "github.com/openshift/console-operator/pkg/console/starter"
    "github.com/openshift/console-operator/pkg/console/subresource/configmap"
    "github.com/openshift/console-operator/pkg/console/subresource/consoleserver"
    "github.com/openshift/console-operator/pkg/console/subresource/deployment"
    "github.com/openshift/console-operator/pkg/console/subresource/oauthclient"
    "github.com/openshift/console-operator/pkg/console/subresource/route"
    "github.com/openshift/console-operator/pkg/console/subresource/secret"
    "github.com/openshift/console-operator/pkg/console/subresource/service"
    "github.com/openshift/console-operator/pkg/console/subresource/util"
    "github.com/openshift/console-operator/pkg/console/controllers/clidownloads"
    "github.com/openshift/console-operator/pkg/console/version"
    "github.com/openshift/console-operator/pkg/crypto"
    # "github.com/openshift/console-operator/pkg/generated"
)

for PACKAGE in "${PACKAGES_TO_TEST[@]}"
do
    os::log::info "Testing ${PACKAGE}"
    go test $PACKAGE
done

OCP_PACKAGES_TO_TEST=(
    "github.com/openshift/console-operator/pkg/console/subresource/configmap"
    "github.com/openshift/console-operator/pkg/console/subresource/deployment"
    "github.com/openshift/console-operator/pkg/console/subresource/oauthclient"
    "github.com/openshift/console-operator/pkg/console/subresource/route"
    "github.com/openshift/console-operator/pkg/console/subresource/secret"
    "github.com/openshift/console-operator/pkg/console/subresource/service"
    "github.com/openshift/console-operator/pkg/console/subresource/util"
    "github.com/openshift/console-operator/pkg/console/version"
)

for PACKAGE in "${OCP_PACKAGES_TO_TEST[@]}"
do
    os::log::info "Testing with tag ocp ${PACKAGE}"
    go test -tags "ocp" $PACKAGE
done
