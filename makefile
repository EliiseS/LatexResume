build:
	pdflatex EliiseSeling.tex

build-customized:
	@echo "Building all customized resumes..."
	@if [ -d "customized" ]; then \
		for dir in customized/*/; do \
			if [ -f "$$dir/EliiseSeling.tex" ]; then \
				echo "Building $$dir..."; \
				cd "$$dir" && pdflatex EliiseSeling.tex && cd ../..; \
			fi \
		done; \
		echo "All customized resumes built successfully!"; \
	else \
		echo "No customized folder found. Create customized resumes first."; \
	fi

clean:
	rm -f *.aux *.log *.out *.dvi *.fls *.fdb_latexmk

clean-customized:
	@echo "Cleaning customized resume build artifacts..."
	@if [ -d "customized" ]; then \
		find customized -name "*.aux" -o -name "*.log" -o -name "*.out" -o -name "*.dvi" -o -name "*.fls" -o -name "*.fdb_latexmk" | xargs rm -f; \
		echo "Customized build artifacts cleaned!"; \
	fi

.PHONY: build build-customized clean clean-customized
