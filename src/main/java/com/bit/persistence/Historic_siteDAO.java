package com.bit.persistence;

import com.bit.domain.Historic_site_detailVO;
import com.bit.domain.Historic_site_imageVO;
import com.bit.domain.Historic_siteVO;
import com.bit.domain.Nearby_attraction_foodVO;
import com.bit.domain.Nearby_attractionVO;

public interface HISTORIC_SITE_DAO {
	
	public void history(Historic_siteVO vo)throws Exception;

	public void history_detail(Historic_site_detailVO vo)throws Exception;
	
	public void history_image(Historic_site_imageVO vo)throws Exception;

	public void food(Nearby_attractionVO vo)throws Exception;

	
}


