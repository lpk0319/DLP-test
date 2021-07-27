func downloadFile(fileFullPath string, res *restful.Response) {
	file, err := os.Open(fileFullPath)

	if err != nil {
		res.WriteEntity(_dto.ErrorDto{Err: err})
		return
	}

	defer file.Close()
	fileName := path.Base(fileFullPath)
	fileName = url.QueryEscape(fileName) // 防止中文乱码
	res.AddHeader("Content-Type", "application/octet-stream")
	res.AddHeader("content-disposition", "attachment; filename=\""+fileName+"\"")
	_, error := io.Copy(res.ResponseWriter, file)
	if error != nil {
		res.WriteErrorString(http.StatusInternalServerError, err.Error())
		return
	}
}