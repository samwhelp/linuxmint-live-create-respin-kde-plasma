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
CMD_FILE_NAME="$(basename "${0}")"




################################################################################
# Option
################################################################################

DEFAULT_SRCDIR="${BASE_DIR_PATH}/prj"
SRCDIR="${SRCDIR:=$DEFAULT_SRCDIR}"


DEFAULT_DESTDIR="${BASE_DIR_PATH}/pkg"
DESTDIR="${DESTDIR:=$DEFAULT_DESTDIR}"




################################################################################
# Util
################################################################################

function util_copy_from_srcdir_to_desdir () {

	local src_dir_path="${1}"
	local des_dir_path="${2}"


	echo
	echo mkdir -p "${src_dir_path}"
	mkdir -p "${src_dir_path}"


	echo
	echo mkdir -p "${des_dir_path}"
	mkdir -p "${des_dir_path}"


	echo
	echo cp -rfT "${src_dir_path}" "${des_dir_path}"
	cp -rfT "${src_dir_path}" "${des_dir_path}"


	echo

	return 0

}




################################################################################
# Module
################################################################################

function mod_theme_install_icon_theme () {

	echo
	echo "Part: mod_theme_install_icon_theme"


	local src_dir_path="${prjdir}/icons"
	local des_dir_path="${pkgdir}/usr/share/icons"

	util_copy_from_srcdir_to_desdir "${src_dir_path}" "${des_dir_path}"


	return 0
}




################################################################################
# Model
################################################################################

function model_canta_icon_theme_installer () {


	echo
	echo "Info: Theme Install"

	echo
	echo "Shell: DESTDIR=${DESTDIR}"

	prjdir="${SRCDIR}"

	pkgdir="${DESTDIR}"


	echo
	echo mkdir -p "${prjdir}"
	mkdir -p "${prjdir}"


	echo
	echo mkdir -p "${pkgdir}"
	mkdir -p "${pkgdir}"




	mod_theme_install_icon_theme




	echo

	return 0

}




################################################################################
# Main
################################################################################

function portal_canta_icon_theme_installer () {

	model_canta_icon_theme_installer "${@}"

}

portal_canta_icon_theme_installer "${@}"
