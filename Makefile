.PHONY: resume
resume: resume.pdf

resume.pdf: resume.typ fonts/Lora-Regular.ttf fonts/Lora-Medium.ttf
	typst compile --font-path fonts resume.typ resume.pdf
