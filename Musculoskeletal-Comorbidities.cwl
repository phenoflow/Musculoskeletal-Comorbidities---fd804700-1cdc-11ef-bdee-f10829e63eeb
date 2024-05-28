cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  musculoskeletal-comorbidities-osteoarthritis---primary:
    run: musculoskeletal-comorbidities-osteoarthritis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  musculoskeletal-comorbidities---primary:
    run: musculoskeletal-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: musculoskeletal-comorbidities-osteoarthritis---primary/output
  musculoskeletal-comorbidities-replacement---primary:
    run: musculoskeletal-comorbidities-replacement---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: musculoskeletal-comorbidities---primary/output
  rheumatoid-musculoskeletal-comorbidities---primary:
    run: rheumatoid-musculoskeletal-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: musculoskeletal-comorbidities-replacement---primary/output
  chronic-musculoskeletal-comorbidities---primary:
    run: chronic-musculoskeletal-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: rheumatoid-musculoskeletal-comorbidities---primary/output
  musculoskeletal-comorbidities-backache---primary:
    run: musculoskeletal-comorbidities-backache---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: chronic-musculoskeletal-comorbidities---primary/output
  right-musculoskeletal-comorbidities---primary:
    run: right-musculoskeletal-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: musculoskeletal-comorbidities-backache---primary/output
  musculoskeletal-comorbidities-spine---primary:
    run: musculoskeletal-comorbidities-spine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: right-musculoskeletal-comorbidities---primary/output
  musculoskeletal-comorbidities-joint---primary:
    run: musculoskeletal-comorbidities-joint---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: musculoskeletal-comorbidities-spine---primary/output
  musculoskeletal-comorbidities-shoulder---primary:
    run: musculoskeletal-comorbidities-shoulder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: musculoskeletal-comorbidities-joint---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: musculoskeletal-comorbidities-shoulder---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
