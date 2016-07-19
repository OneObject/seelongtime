package com.longtime.app.remind.repository.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.remind.model.Remind;
import com.longtime.app.remind.repository.RemindRepository;
import com.myctu.platform.repository.engine.storage.mongo.repository.BaseMongoCRUDRepository;

/**
 * 实现类
 * @author chenkf
 *
 */
@Repository(value="remindRepository")
public class RemindRepositoryImpl extends BaseMongoCRUDRepository< Remind, String> implements RemindRepository{

}
