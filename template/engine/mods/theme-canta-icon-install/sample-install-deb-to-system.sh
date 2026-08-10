#!/usr/bin/env bash


################################################################################
# Set up the environment
################################################################################

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error


################################################################################
# Base Path
################################################################################

BASE_DIR_PATH="$(dirname "$(realpath "${0}")")"
LIBS_DIR_PATH="$(realpath "${BASE_DIR_PATH}/../../libs")"


################################################################################
# Init
################################################################################

source "${LIBS_DIR_PATH}/domain/worker/init.sh"




################################################################################
# Option
################################################################################

##TARGET_DIR_PATH="${BASE_DIR_PATH}"
TARGET_DIR_PATH="/tmp"


DEFAULT_ASSET_DIR_PATH="${BASE_DIR_PATH}/asset"
REF_ASSET_DIR_PATH="${REF_ASSET_DIR_PATH:=$DEFAULT_ASSET_DIR_PATH}"


#DEFAULT_BUILD_DIR_PATH="${TARGET_DIR_PATH}/build"
DEFAULT_BUILD_DIR_PATH="${TARGET_DIR_PATH}/build-canta-icon-theme"
REF_BUILD_DIR_PATH="${REF_BUILD_DIR_PATH:=$DEFAULT_BUILD_DIR_PATH}"


DEFAULT_REPO_URL="https://github.com/samwhelp/canta-icon-theme-remix.git"
REF_REPO_URL="${REF_REPO_URL:=$DEFAULT_REPO_URL}"


DEFAULT_SUBJECT_NAME="canta-icon-theme"
REF_SUBJECT_NAME="${REF_SUBJECT_NAME:=$DEFAULT_SUBJECT_NAME}"



################################################################################
# Module
################################################################################

function mod_clean_pre_build () {
	rm -rf "${DEFAULT_BUILD_DIR_PATH}"
}

function mod_theme_project_clone () {
	echo
	echo "Info: mod_theme_project_clone"
	echo

	#echo
	#echo apt install -y git
	#apt install -y git

	git clone "${REF_REPO_URL}" "${prjdir}"
}

function mod_theme_copy_installer () {
	install -Dm755 "${REF_ASSET_DIR_PATH}/installer.sh" "${REF_BUILD_DIR_PATH}/installer.sh"
}

function mod_theme_run_installer () {
	"${REF_BUILD_DIR_PATH}/installer.sh"
}

function mod_install_theme_raw_to_system () {
	echo
	echo "Info: mod_install_theme_raw_to_system"
	echo
	echo cp -rfT "${pkgdir}" /
	#cp -rfT "${pkgdir}" /
}

function mod_install_theme_deb_to_system () {
	echo
	echo "Info: mod_install_theme_deb_to_system"
	echo

	echo
	echo dpkg -i "${deb_file_path}"
	dpkg -i "${deb_file_path}"
}


function mod_create_theme_deb () {
	echo
	echo "Info: mod_create_theme_deb"
	echo


	local build_dir="${REF_BUILD_DIR_PATH}"
	local subject_name="${REF_SUBJECT_NAME}"
	local debdir="${build_dir}/${subject_name}"
	deb_file_path="${debdir}.deb"


	echo
	echo mkdir -p "${debdir}/DEBIAN"
	mkdir -p "${debdir}/DEBIAN"


	echo
	echo cp -rfT "${pkgdir}" "${debdir}"
	cp -rfT "${pkgdir}" "${debdir}"


cat > "${debdir}/DEBIAN/control" << EOF
Package: canta-icon-theme
Version: 0.1
Architecture: all
Description: This is a theme package for canta-icon-theme.
Maintainer: developer <developer@home.heaven>
EOF


	cd "${build_dir}"
	echo
	echo dpkg-deb --root-owner-group --build "${subject_name}"
	dpkg-deb --root-owner-group --build "${subject_name}"
	echo
	cd "${OLDPWD}"

}



################################################################################
# Model
################################################################################

function model_theme_canta_icon_install () {

	prjdir="${REF_BUILD_DIR_PATH}/prj"

	pkgdir="${REF_BUILD_DIR_PATH}/pkg"


	mod_clean_pre_build

	mod_theme_project_clone

	mod_theme_copy_installer

	mod_theme_run_installer

	#mod_install_theme_raw_to_system

	mod_create_theme_deb

	mod_install_theme_deb_to_system

}




################################################################################
# Main
################################################################################

function portal_theme_canta_icon_install () {

	core_check_permission

	print_info "Install canta-icon Theme ..."
	model_theme_canta_icon_install
	judge "Install canta-icon Theme"

}

portal_theme_canta_icon_install
