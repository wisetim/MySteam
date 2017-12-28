package com.mysteam.mapper;

import com.mysteam.entity.Review;

public interface ReviewMapper {
    int deleteByPrimaryKey(Integer reviewId);

    int insert(Review record);

    int insertSelective(Review record);

    Review selectByPrimaryKey(Integer reviewId);

    int updateByPrimaryKeySelective(Review record);

    int updateByPrimaryKey(Review record);
}