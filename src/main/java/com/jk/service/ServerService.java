package com.jk.service;

import java.util.HashMap;

public interface ServerService {


    HashMap<String, Object> queryListPage(Integer page, Integer rows);
}
