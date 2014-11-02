build:
	middleman build

serve:
	middleman server

release: build
	rsync -auvz --delete --exclude=*.swp --exclude=*.orig build/* philip.so:onemancrew

.PHONY: release build serve
