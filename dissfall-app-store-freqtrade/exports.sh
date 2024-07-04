UMBREL_DATA_DIR="${UMBREL_ROOT}/data"
UMBREL_DATA_STORAGE_DIR="${UMBREL_DATA_DIR}/storage"
UMBREL_DATA_STORAGE_FREQTRADE_DIR="${UMBREL_DATA_STORAGE_DIR}/freqtrade"
DESIRED_OWNER="1000:1000"

if [[ ! -d "${UMBREL_DATA_STORAGE_FREQTRADE_DIR}" ]]; then
  mkdir -p "${UMBREL_DATA_STORAGE_FREQTRADE_DIR}"
fi

set_correct_permissions() {
	local -r path="${1}"

	if [[ -d "${path}" ]]; then
		owner=$(stat -c "%u:%g" "${path}")

		if [[ "${owner}" != "${DESIRED_OWNER}" ]]; then
			chown "${DESIRED_OWNER}" "${path}"
		fi
	fi
}

set_correct_permissions "${UMBREL_DATA_STORAGE_FREQTRADE_DIR}"
