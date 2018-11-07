#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

requirements:
  ScatterFeatureRequirement: {}

inputs:
  message_array: string[]

# scatter tells the runner that we want to scatter over this input for this step.
# input name listed after scatter is one of the steps input, not workflow inputs
# tool does not collect any outputs, so still use outputs: []

steps:
  echo:
    run: 1st-tool.cwl
    scatter: message
    in:
      message: message_array
    out: [echo_out]
  wc:
    run: wc-tool.cwl
    scatter: input_file
    in:
      input_file: echo/echo_out
    out: []

outputs: []
