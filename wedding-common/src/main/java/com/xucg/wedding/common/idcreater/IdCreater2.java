package com.xucg.wedding.common.idcreater;

public class IdCreater2 {


    public Long getID(int workerId, int dcId){

        IdWorker idWorker = new IdWorker(workerId, dcId);
        return idWorker.nextId();
    }
}
