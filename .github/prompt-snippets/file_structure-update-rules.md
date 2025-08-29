## file_structure.md Rules on the Level of Detail

Include every file in this workspace EXCEPT the following:

- Exclude the files in each example in `examples/<example_name>/**/*.*`. Only include the `examples/<example_name>` folder
- Exclude everything specified in the `.gitignore` file
- Exclude files in the `docs/plans` folder
- Exclude System generated, temporary, or local-only files and folders (e.g. `.git`, `.env`, `terraform.tfstate`, etc.)

## Format

When generating the tree, add a comment on the right to describe the folder or file. For example

```text
razterraform/
├── .github/               # GitHub configs, workflows, AI instructions
└── README.md              # Overview & onboarding
```

## Additional Instructions

- Update the change log at the bottom of `file_structure.md`, in chronological order, with the most recent update at the top.
