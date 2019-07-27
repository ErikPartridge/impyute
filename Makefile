.PHONY: all build test upload install docs

all: test

test: pytest

# Need to pip install `wheel` and `twine`
upload: test docs
	python3 setup.py bdist_wheel --universal
	python3 setup.py sdist
	twine upload dist/*

install:
	python3 setup.py install

docs:
	cd docs && $(MAKE) html
