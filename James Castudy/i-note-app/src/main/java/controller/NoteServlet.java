package controller;

import dao.NoteDao;
import dao.NoteDaoImpl;
import model.Note;
import model.Type;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "NoteServlet", urlPatterns = "/ListNote")
public class NoteServlet extends javax.servlet.http.HttpServlet {

    private NoteDao noteDao = new NoteDaoImpl();

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setAttribute("Error",null);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createNote(request, response);
                    break;
                case "edit":
                    editNote(request, response);
                    break;
                default:
                    showListNote(request,response);
                    break;
            }
        } catch (Exception e) {
            System.out.println("Error");
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setAttribute("Error",null);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String select = request.getParameter("selectValue");
        String search = request.getParameter("search");
        if (search!=null) {
            showSearchNote(request,response);
            return;
        }
        if (select!=null) {
            showSelectNote(request,response);
            return;
        }
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateNote(request, response);
                    break;
                case "view":
                    showViewNote(request, response);
                    break;
                case "edit":
                    showEditNote(request, response);
                    break;
                case "delete":
                    deleteNote(request, response);
                    break;
                default:
                    showListNote(request,response);
                    break;
            }
        } catch (Exception e) {
            System.out.println("Error");
        }
    }

    private void showSearchNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Note> noteList = this.noteDao.getList();
        List<Note> noteList1 = new ArrayList<>();
        for(Note note : noteList) {
            if (note.getContent().toLowerCase().contains(search.toLowerCase().trim())) {
                noteList1.add(note);
            }
        }
        request.setAttribute("ListNote",noteList1);
        if (noteList1.size()==0) {
            request.setAttribute("ListNote",noteList);
            request.setAttribute("Error","NotFound!!");
        }
        List<Type> typeList = this.noteDao.getListType();
        request.setAttribute("ListType",typeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/ListNote.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showSelectNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectTypeId = request.getParameter("selectValue");
        List<Note> noteList = this.noteDao.getList();
        List<Note> noteList1 = new ArrayList<>();
        for(Note note : noteList) {
            if (selectTypeId.equals(String.valueOf(note.getTypeId()))) {
                noteList1.add(note);
            }
        }
        request.setAttribute("ListNote",noteList1);
        List<Type> typeList = this.noteDao.getListType();
        request.setAttribute("ListType",typeList);
        request.setAttribute("SelectType",selectTypeId);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/ListNote.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showListNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Note> noteList = this.noteDao.getList();
        request.setAttribute("ListNote",noteList);
        List<Type> typeList = this.noteDao.getListType();
        request.setAttribute("ListNote",noteList);
        request.setAttribute("ListType",typeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/ListNote.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showViewNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Note note = this.noteDao.getNote(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("ViewNote",note);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/Note.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showCreateNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("NewNote",null);
        List<Type> typeList = this.noteDao.getListType();
        request.setAttribute("ListType",typeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/NoteApp.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showEditNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Note note = this.noteDao.getNote(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("NewNote",note);
        List<Type> typeList = this.noteDao.getListType();
        request.setAttribute("ListType",typeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/NoteApp.jsp");
        requestDispatcher.forward(request,response);
    }

    private void createNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Note note = new Note();
        note.setTitle(request.getParameter("title"));
        note.setContent(request.getParameter("content"));
        note.setTypeId(Integer.parseInt(request.getParameter("selectType")));
        this.noteDao.insert(note);
        showListNote(request,response);
    }

    private void deleteNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        this.noteDao.delete(id);
        showListNote(request,response);
    }

    private void editNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Note note = new Note();
        note.setTitle(request.getParameter("title"));
        note.setContent(request.getParameter("content"));
        note.setTypeId(Integer.parseInt(request.getParameter("selectType")));
        note.setId(Integer.parseInt(request.getParameter("id")));
        this.noteDao.update(note);
        showListNote(request,response);
    }
}
