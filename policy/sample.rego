package main

deny contains msg if {
    input.kind == "Deployment"
    not (input.spec.selector.matchLabels.app == input.spec.template.metadata.labels.app)
    msg := sprintf("Pod TemplateとSelectorには同じappラベルを付与してください: %s", [input.metadata.name])
}