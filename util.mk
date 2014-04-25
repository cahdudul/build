
.PHONY: update
update:
	@echo "Update new code"
	#firstpatch : getsmali resource
	ifneq ($(ORGIN_SECOND_FRAMEWORK_NAME), )
		${PORT_TOOLS}/copy_fold.sh smali/${ORGIN_SECOND_FRAMEWORK_NAME}.out/ smali/framework.jar.out/
		rm -rf smali/${ORGIN_SECOND_FRAMEWORK_NAME}.out
	endif


	cat ${PORT_ROOT}/smali/sourcechange.txt ${PORT_ROOT}/last_smali/sourcechange.txt | sort | uniq > ${PORT_ROOT}/device/sourcechange.txt
	${PORT_TOOLS}/patch_color_framework.sh ${PORT_ROOT}/last_smali/color ${PORT_ROOT}/smali/color ${PWD}/smali/ ${PORT_ROOT}/device/sourcechange.txt

firstpatch : getsmali resource
	@echo "First patch, We will autopatch changed smali files, you should modify files in dir temp/reject"
	${PORT_TOOLS}/patch_color_framework.sh ${PORT_ROOT}/smali/android ${PORT_ROOT}/smali/color ${PWD}/smali/ ${PORT_ROOT}/smali/sourcechange.txt
