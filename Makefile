JULIA = julia
JULIA_CMD = $(JULIA) --startup-file=no

.PHONY: demo

demo: sys.so
	JULIA_LOAD_PATH=$(PWD)/demo $(JULIA_CMD) -J sys.so --project=demo -E nothing

sys.so: compile.jl precompile.jl
	$(JULIA_CMD) --project=. $<
