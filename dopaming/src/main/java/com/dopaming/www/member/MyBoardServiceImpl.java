package com.dopaming.www.member;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dopaming.www.acorn.AcornVO;
import com.dopaming.www.file.FileDAOMybatis_Hwan;
import com.dopaming.www.file.FilePostVO_Hwan;


@Service("myBoardService")
public class MyBoardServiceImpl implements MyBoardService {

	@Autowired
	private MyBoardDAO dao;
	
	@Autowired
	private FileDAOMybatis_Hwan filedao;
	
	@Override
	public List<MyBoardVO> getDownList(MyBoardVO vo) {
		return dao.getDownList(vo);
	}

	@Override
	public Integer getDownCount(MyBoardVO vo) {
		return dao.getDownCount(vo);
	}

	@Override
	public List<FileUploadVO> getUploadList(FileUploadVO vo) {
		return dao.getUploadList(vo);
	}

	@Override
	public Integer getUploadCount(FileUploadVO vo) {
		return dao.getUploadCount(vo);
	}

	@Override
	public void deleteBoard(FileUploadVO vo) {
		FilePostVO_Hwan fvo = new FilePostVO_Hwan();
		fvo.setBoard_no(vo.getBoard_no());
		List<FilePostVO_Hwan> list = filedao.select_post_fileList(fvo);
		for(int i = 0; i<list.size(); i++) {
			File file = new File(vo.getPath(),list.get(i).getFileName_List());
			file.delete();
		}
		dao.deleteUpload(vo);
		dao.deleteComments(vo);
		dao.deleteBoard(vo);
	}

	@Override
	public List<AcornVO> getAcornList(MyAcornVO vo) {
		return dao.getAcornList(vo);
	}

	@Override
	public Integer getAcornCount(MyAcornVO vo) {
		return dao.getAcornCount(vo);
	}

	@Override
	public Integer getAcorn(MyAcornVO vo) {
		return dao.getAcorn(vo);
	}

}
