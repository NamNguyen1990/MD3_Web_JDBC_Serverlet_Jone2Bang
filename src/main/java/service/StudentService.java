package service;

import model.Student;

import java.util.List;

public interface StudentService extends GeneralService <Student> {
    List <Student> findAllByClass (int cID);
}
