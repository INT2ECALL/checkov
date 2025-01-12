from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.kubernetes.checks.resource.base_spec_check import BaseK8Check


class AllowedCapabilities(BaseK8Check):

    def __init__(self):
        # CIS-1.5 5.2.8
        name = "Minimize the admission of containers with added capability"
        # Do not generally permit containers with capabilities assigned beyond the default set
        # https://kubernetes.io/docs/concepts/policy/pod-security-policy/#capabilities
        # Location: container .spec.allowedCapabilities
        id = "CKV_K8S_25"
        supported_kind = ['containers', 'initContainers']
        categories = [CheckCategories.KUBERNETES]
        super().__init__(name=name, id=id, categories=categories, supported_entities=supported_kind)

    def get_resource_id(self, conf):
        return f'{conf["parent"]} - {conf["name"]}' if conf.get('name') else conf["parent"]

    def scan_spec_conf(self, conf):
        if conf.get("securityContext"):
            if conf["securityContext"].get("capabilities"):
                if conf["securityContext"]["capabilities"].get("add"):
                    if conf["securityContext"]["capabilities"]["add"]:
                        return CheckResult.FAILED
        return CheckResult.PASSED


check = AllowedCapabilities()
