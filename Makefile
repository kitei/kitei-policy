#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

SHELL = /bin/sh
.SUFFIXES:
.PHONY: help clean install deploy release

MAVEN = ./mvnw

export MAVEN_OPTS MAVEN_CONFIG

default: help

clean:
	${MAVEN} clean

install:
	${MAVEN} clean install

deploy:
	${MAVEN} clean deploy

release:
	${MAVEN} clean release:clean release:prepare release:perform

help:
	@echo " * clean        - clean local build tree"
	@echo " * install      - installs build result in the local maven repository"
	@echo " * deploy       - installs build result in the snapshot OSS repository"
	@echo " * release      - release a new version to maven central"
