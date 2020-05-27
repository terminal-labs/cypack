.PHONY: build dist redist install install-from-source clean uninstall

build:
	CYTHONIZE=1 ./setup.py build

dist:
	CYTHONIZE=1 ./setup.py sdist bdist_wheel

redist: clean dist

install:
	CYTHONIZE=1 pip install .

install-from-source: dist
	pip install dist/cython-package-example-0.1.5.tar.gz

clean:
	$(RM) -r build dist
	$(RM) -r src/cypack/{utils.c,answer.c,fibonacci.c} src/cypack/sub/wrong.c
	$(RM) -r src/*.egg-info
	#git clean -fdX

uninstall:
	pip uninstall cython-package-example
