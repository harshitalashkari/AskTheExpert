package dao;

import dbcon.DatabaseConnection;
import java.sql.*;
import dto.Answers_dto;
import java.util.ArrayList;

public class Answers_dao{

    Connection con ;
    PreparedStatement pst;
    ResultSet rs;
    
    public boolean addAnswer(Answers_dto obj){
    
        boolean b = false;
        
        try{
        
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("insert into answers(answer, question_id, expert_email_id, agree, disagree) values(?,?,?,?,?)");
            pst.setString(1, obj.getAnswer());
            pst.setInt(2, obj.getQuestionID());
            pst.setString(3, obj.getExpertID());
            pst.setInt(4, obj.getAgree());
            pst.setInt(5, obj.getDisagree());
            
            int x = pst.executeUpdate();
            
            if(x>0)
                b = true;
            
            con.close();
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return b;
    }
    
    public boolean deleteAnswer(int answerId){
        
        boolean b = false;
        
        try{
            
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("delete from answers where answer_id = ?");
            pst.setInt(1, answerId);
            
            int x = pst.executeUpdate();
            
            if(x>0)
                b = true;
            
            con.close();
        
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return b;
    }
    
    public boolean deleteAnswerFromQuesId(int questionId){
        
        boolean b = false;
        
        try{
            
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("delete from answers where question_id = ?");
            pst.setInt(1, questionId);
            
            int x = pst.executeUpdate();
            
            if(x>0)
                b = true;
            
            con.close();
        
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return b;
    }
    
    public ArrayList<Answers_dto> getAllAnsweredQuestions(String expertMailID){
        
        ArrayList<Answers_dto> ansDetails = new ArrayList<>();
        
        try{
        
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("select * from answers where expert_email_id = ?");
            pst.setString(1, expertMailID);
            
            rs = pst.executeQuery();
            
            if(rs.isBeforeFirst()){
                while(rs.next()) {
                    
                    Answers_dto obj = new Answers_dto();
                    obj.setAnswerID(rs.getInt("answer_id"));
                    obj.setAnswer(rs.getString("answer"));
                    obj.setQuestionID(rs.getInt("question_id"));
                    obj.setExpertID(rs.getString("expert_email_id"));
                    obj.setAgree(rs.getInt("agree"));
                    obj.setDisagree(rs.getInt("disagree"));
                    
                    ansDetails.add(obj);
                }
            }
           
            con.close();
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return ansDetails;
    }
    
    public int checkForAnsweredQuestions(String expertId, int quesId){
    
        int quesID = -1;
        
        try{
            
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("select question_id from answers where expert_email_id = ? and question_id = ?");
            pst.setString(1, expertId);
            pst.setInt(2, quesId);
            
            rs = pst.executeQuery();
            
            if(rs.isBeforeFirst()){
                rs.next();
                quesID = rs.getInt("question_id");
            }
            
            con.close();
        
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return quesID;
    }
    
    public ArrayList<Answers_dto> getAllAnswersOfQuestion(int quesId){
        
        ArrayList<Answers_dto> ansList = new ArrayList<>();
        
        try{
            
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("select * from answers where question_id = ?");
            pst.setInt(1, quesId);
            
            rs = pst.executeQuery();
            
            if(rs.isBeforeFirst()){
                while(rs.next()){
                    Answers_dto obj = new Answers_dto();
                    obj.setAnswerID(rs.getInt("answer_id"));
                    obj.setAnswer(rs.getString("answer"));
                    obj.setQuestionID(rs.getInt("question_id"));
                    obj.setExpertID(rs.getString("expert_email_id"));
                    obj.setAgree(rs.getInt("agree"));
                    obj.setDisagree(rs.getInt("disagree"));
                    
                    ansList.add(obj);
                }
            }
            
            con.close();
        
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return ansList;
    }
    
    public boolean incrementAgree(int answerId){
        
        boolean b = false;
        int agree = -1;
        
        try{
            
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("select agree from answers where answer_id = ?");
            pst.setInt(1, answerId);
            
            rs = pst.executeQuery();
            
            if(rs.isBeforeFirst()){
                rs.next();
                agree = rs.getInt("agree");
            }
            
            pst = con.prepareStatement("update answers set agree = ? where answer_id = ?");
            pst.setInt(1, agree+1);
            pst.setInt(2, answerId);
            
            int x = pst.executeUpdate();
            
            if(x>0)
                b = true;
            
            con.close();
        
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return b;
    }
    
    public boolean incrementDisagree(int answerId){
        
        boolean b = false;
        int disagree = -1;
        
        try{
            
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("select disagree from answers where answer_id = ?");
            pst.setInt(1, answerId);
            
            rs = pst.executeQuery();
            
            if(rs.isBeforeFirst()){
                rs.next();
                disagree = rs.getInt("disagree");
            }
            
            pst = con.prepareStatement("update answers set disagree = ? where answer_id = ?");
            pst.setInt(1, disagree+1);
            pst.setInt(2, answerId);
            
            int x = pst.executeUpdate();
            
            if(x>0)
                b = true;
            
            con.close();
        
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return b;
    }
}