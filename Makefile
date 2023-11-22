.DEFAULT: help

.PHONY: hello
	@echo "hello world"

##help: 도움말 (기본명령)
.PHONY: help
help: Makefile
	@echo ""
	@echo "사용 방법:"
	@echo ""
	@echo "	make (명령어)"
	@echo ""
	@echo "명령어:"
	@echo ""
	@sed -n 's/^##/	/p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo ""

##edit : 프로젝트 편집 열기 (= tuist edit)
.PHONY: edit
edit:
	@tuist edit

##clean: 프로젝트 클린 (= tuist clean)
.PHONY: clean
clean:
	@tuist clean
	
.PHONY remove:
remove:
	rm -rf **/App/Qoo10
	rm -rf **/App/WeApp
	rm -rf *.xcworkspace
	
##fetch: 외부종속성 업데이트 (= tuist fetch)
.PHONY: fetch
fetch:
	@tuist fetch

##open: 프로젝트 생성 & 열기 (= tuist generate)
.PHONY: open
open:
	@TUIST_DEV=1 TUIST_ROOT_DIR=${PWD} tuist generate --no-open && bundle exec pod install && open TuistDemo.xcworkspace

.PHONY: topen
topen:
	@TUIST_DEV=0 TUIST_ROOT_DIR=${PWD} tuist generate --no-open && bundle exec pod install && open TuistDemo.xcworkspace

##copen: 프로젝트 클린 후, 생성 & 열기 (= tuist clean/fetch/generate)
.PHONY: copen
copen: clean fetch open

##graph: 프로젝트 의존성 그래프 생성
.PHONY: graph
graph:
	@tuist graph
	
##sgraph: 심플한 프로젝트 의존성 그래프 생성
.PHONY: sgraph
sgraph:
	@tuist graph -t -d

##module : 모듈 생성
.PHONY: module
module:
	swift Scripts/test.swift
