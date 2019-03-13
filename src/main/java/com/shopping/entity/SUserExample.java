package com.shopping.entity;

import org.springframework.boot.autoconfigure.domain.EntityScan;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class SUserExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SUserExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andUseridIsNull() {
            addCriterion("userid is null");
            return (Criteria) this;
        }

        public Criteria andUseridIsNotNull() {
            addCriterion("userid is not null");
            return (Criteria) this;
        }

        public Criteria andUseridEqualTo(Integer value) {
            addCriterion("userid =", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotEqualTo(Integer value) {
            addCriterion("userid <>", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThan(Integer value) {
            addCriterion("userid >", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("userid >=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThan(Integer value) {
            addCriterion("userid <", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThanOrEqualTo(Integer value) {
            addCriterion("userid <=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridIn(List<Integer> values) {
            addCriterion("userid in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotIn(List<Integer> values) {
            addCriterion("userid not in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridBetween(Integer value1, Integer value2) {
            addCriterion("userid between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotBetween(Integer value1, Integer value2) {
            addCriterion("userid not between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andUsernameIsNull() {
            addCriterion("username is null");
            return (Criteria) this;
        }

        public Criteria andUsernameIsNotNull() {
            addCriterion("username is not null");
            return (Criteria) this;
        }

        public Criteria andUsernameEqualTo(String value) {
            addCriterion("username =", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotEqualTo(String value) {
            addCriterion("username <>", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameGreaterThan(String value) {
            addCriterion("username >", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameGreaterThanOrEqualTo(String value) {
            addCriterion("username >=", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameLessThan(String value) {
            addCriterion("username <", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameLessThanOrEqualTo(String value) {
            addCriterion("username <=", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameLike(String value) {
            addCriterion("username like", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotLike(String value) {
            addCriterion("username not like", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameIn(List<String> values) {
            addCriterion("username in", values, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotIn(List<String> values) {
            addCriterion("username not in", values, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameBetween(String value1, String value2) {
            addCriterion("username between", value1, value2, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotBetween(String value1, String value2) {
            addCriterion("username not between", value1, value2, "username");
            return (Criteria) this;
        }

        public Criteria andUserpassIsNull() {
            addCriterion("userpass is null");
            return (Criteria) this;
        }

        public Criteria andUserpassIsNotNull() {
            addCriterion("userpass is not null");
            return (Criteria) this;
        }

        public Criteria andUserpassEqualTo(String value) {
            addCriterion("userpass =", value, "userpass");
            return (Criteria) this;
        }

        public Criteria andUserpassNotEqualTo(String value) {
            addCriterion("userpass <>", value, "userpass");
            return (Criteria) this;
        }

        public Criteria andUserpassGreaterThan(String value) {
            addCriterion("userpass >", value, "userpass");
            return (Criteria) this;
        }

        public Criteria andUserpassGreaterThanOrEqualTo(String value) {
            addCriterion("userpass >=", value, "userpass");
            return (Criteria) this;
        }

        public Criteria andUserpassLessThan(String value) {
            addCriterion("userpass <", value, "userpass");
            return (Criteria) this;
        }

        public Criteria andUserpassLessThanOrEqualTo(String value) {
            addCriterion("userpass <=", value, "userpass");
            return (Criteria) this;
        }

        public Criteria andUserpassLike(String value) {
            addCriterion("userpass like", value, "userpass");
            return (Criteria) this;
        }

        public Criteria andUserpassNotLike(String value) {
            addCriterion("userpass not like", value, "userpass");
            return (Criteria) this;
        }

        public Criteria andUserpassIn(List<String> values) {
            addCriterion("userpass in", values, "userpass");
            return (Criteria) this;
        }

        public Criteria andUserpassNotIn(List<String> values) {
            addCriterion("userpass not in", values, "userpass");
            return (Criteria) this;
        }

        public Criteria andUserpassBetween(String value1, String value2) {
            addCriterion("userpass between", value1, value2, "userpass");
            return (Criteria) this;
        }

        public Criteria andUserpassNotBetween(String value1, String value2) {
            addCriterion("userpass not between", value1, value2, "userpass");
            return (Criteria) this;
        }

        public Criteria andUserrealnameIsNull() {
            addCriterion("userrealname is null");
            return (Criteria) this;
        }

        public Criteria andUserrealnameIsNotNull() {
            addCriterion("userrealname is not null");
            return (Criteria) this;
        }

        public Criteria andUserrealnameEqualTo(String value) {
            addCriterion("userrealname =", value, "userrealname");
            return (Criteria) this;
        }

        public Criteria andUserrealnameNotEqualTo(String value) {
            addCriterion("userrealname <>", value, "userrealname");
            return (Criteria) this;
        }

        public Criteria andUserrealnameGreaterThan(String value) {
            addCriterion("userrealname >", value, "userrealname");
            return (Criteria) this;
        }

        public Criteria andUserrealnameGreaterThanOrEqualTo(String value) {
            addCriterion("userrealname >=", value, "userrealname");
            return (Criteria) this;
        }

        public Criteria andUserrealnameLessThan(String value) {
            addCriterion("userrealname <", value, "userrealname");
            return (Criteria) this;
        }

        public Criteria andUserrealnameLessThanOrEqualTo(String value) {
            addCriterion("userrealname <=", value, "userrealname");
            return (Criteria) this;
        }

        public Criteria andUserrealnameLike(String value) {
            addCriterion("userrealname like", value, "userrealname");
            return (Criteria) this;
        }

        public Criteria andUserrealnameNotLike(String value) {
            addCriterion("userrealname not like", value, "userrealname");
            return (Criteria) this;
        }

        public Criteria andUserrealnameIn(List<String> values) {
            addCriterion("userrealname in", values, "userrealname");
            return (Criteria) this;
        }

        public Criteria andUserrealnameNotIn(List<String> values) {
            addCriterion("userrealname not in", values, "userrealname");
            return (Criteria) this;
        }

        public Criteria andUserrealnameBetween(String value1, String value2) {
            addCriterion("userrealname between", value1, value2, "userrealname");
            return (Criteria) this;
        }

        public Criteria andUserrealnameNotBetween(String value1, String value2) {
            addCriterion("userrealname not between", value1, value2, "userrealname");
            return (Criteria) this;
        }

        public Criteria andUsersexIsNull() {
            addCriterion("usersex is null");
            return (Criteria) this;
        }

        public Criteria andUsersexIsNotNull() {
            addCriterion("usersex is not null");
            return (Criteria) this;
        }

        public Criteria andUsersexEqualTo(String value) {
            addCriterion("usersex =", value, "usersex");
            return (Criteria) this;
        }

        public Criteria andUsersexNotEqualTo(String value) {
            addCriterion("usersex <>", value, "usersex");
            return (Criteria) this;
        }

        public Criteria andUsersexGreaterThan(String value) {
            addCriterion("usersex >", value, "usersex");
            return (Criteria) this;
        }

        public Criteria andUsersexGreaterThanOrEqualTo(String value) {
            addCriterion("usersex >=", value, "usersex");
            return (Criteria) this;
        }

        public Criteria andUsersexLessThan(String value) {
            addCriterion("usersex <", value, "usersex");
            return (Criteria) this;
        }

        public Criteria andUsersexLessThanOrEqualTo(String value) {
            addCriterion("usersex <=", value, "usersex");
            return (Criteria) this;
        }

        public Criteria andUsersexLike(String value) {
            addCriterion("usersex like", value, "usersex");
            return (Criteria) this;
        }

        public Criteria andUsersexNotLike(String value) {
            addCriterion("usersex not like", value, "usersex");
            return (Criteria) this;
        }

        public Criteria andUsersexIn(List<String> values) {
            addCriterion("usersex in", values, "usersex");
            return (Criteria) this;
        }

        public Criteria andUsersexNotIn(List<String> values) {
            addCriterion("usersex not in", values, "usersex");
            return (Criteria) this;
        }

        public Criteria andUsersexBetween(String value1, String value2) {
            addCriterion("usersex between", value1, value2, "usersex");
            return (Criteria) this;
        }

        public Criteria andUsersexNotBetween(String value1, String value2) {
            addCriterion("usersex not between", value1, value2, "usersex");
            return (Criteria) this;
        }

        public Criteria andUserbirthdayIsNull() {
            addCriterion("userbirthday is null");
            return (Criteria) this;
        }

        public Criteria andUserbirthdayIsNotNull() {
            addCriterion("userbirthday is not null");
            return (Criteria) this;
        }

        public Criteria andUserbirthdayEqualTo(Date value) {
            addCriterionForJDBCDate("userbirthday =", value, "userbirthday");
            return (Criteria) this;
        }

        public Criteria andUserbirthdayNotEqualTo(Date value) {
            addCriterionForJDBCDate("userbirthday <>", value, "userbirthday");
            return (Criteria) this;
        }

        public Criteria andUserbirthdayGreaterThan(Date value) {
            addCriterionForJDBCDate("userbirthday >", value, "userbirthday");
            return (Criteria) this;
        }

        public Criteria andUserbirthdayGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("userbirthday >=", value, "userbirthday");
            return (Criteria) this;
        }

        public Criteria andUserbirthdayLessThan(Date value) {
            addCriterionForJDBCDate("userbirthday <", value, "userbirthday");
            return (Criteria) this;
        }

        public Criteria andUserbirthdayLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("userbirthday <=", value, "userbirthday");
            return (Criteria) this;
        }

        public Criteria andUserbirthdayIn(List<Date> values) {
            addCriterionForJDBCDate("userbirthday in", values, "userbirthday");
            return (Criteria) this;
        }

        public Criteria andUserbirthdayNotIn(List<Date> values) {
            addCriterionForJDBCDate("userbirthday not in", values, "userbirthday");
            return (Criteria) this;
        }

        public Criteria andUserbirthdayBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("userbirthday between", value1, value2, "userbirthday");
            return (Criteria) this;
        }

        public Criteria andUserbirthdayNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("userbirthday not between", value1, value2, "userbirthday");
            return (Criteria) this;
        }

        public Criteria andUseremailIsNull() {
            addCriterion("useremail is null");
            return (Criteria) this;
        }

        public Criteria andUseremailIsNotNull() {
            addCriterion("useremail is not null");
            return (Criteria) this;
        }

        public Criteria andUseremailEqualTo(String value) {
            addCriterion("useremail =", value, "useremail");
            return (Criteria) this;
        }

        public Criteria andUseremailNotEqualTo(String value) {
            addCriterion("useremail <>", value, "useremail");
            return (Criteria) this;
        }

        public Criteria andUseremailGreaterThan(String value) {
            addCriterion("useremail >", value, "useremail");
            return (Criteria) this;
        }

        public Criteria andUseremailGreaterThanOrEqualTo(String value) {
            addCriterion("useremail >=", value, "useremail");
            return (Criteria) this;
        }

        public Criteria andUseremailLessThan(String value) {
            addCriterion("useremail <", value, "useremail");
            return (Criteria) this;
        }

        public Criteria andUseremailLessThanOrEqualTo(String value) {
            addCriterion("useremail <=", value, "useremail");
            return (Criteria) this;
        }

        public Criteria andUseremailLike(String value) {
            addCriterion("useremail like", value, "useremail");
            return (Criteria) this;
        }

        public Criteria andUseremailNotLike(String value) {
            addCriterion("useremail not like", value, "useremail");
            return (Criteria) this;
        }

        public Criteria andUseremailIn(List<String> values) {
            addCriterion("useremail in", values, "useremail");
            return (Criteria) this;
        }

        public Criteria andUseremailNotIn(List<String> values) {
            addCriterion("useremail not in", values, "useremail");
            return (Criteria) this;
        }

        public Criteria andUseremailBetween(String value1, String value2) {
            addCriterion("useremail between", value1, value2, "useremail");
            return (Criteria) this;
        }

        public Criteria andUseremailNotBetween(String value1, String value2) {
            addCriterion("useremail not between", value1, value2, "useremail");
            return (Criteria) this;
        }

        public Criteria andUserphoneIsNull() {
            addCriterion("userphone is null");
            return (Criteria) this;
        }

        public Criteria andUserphoneIsNotNull() {
            addCriterion("userphone is not null");
            return (Criteria) this;
        }

        public Criteria andUserphoneEqualTo(String value) {
            addCriterion("userphone =", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneNotEqualTo(String value) {
            addCriterion("userphone <>", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneGreaterThan(String value) {
            addCriterion("userphone >", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneGreaterThanOrEqualTo(String value) {
            addCriterion("userphone >=", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneLessThan(String value) {
            addCriterion("userphone <", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneLessThanOrEqualTo(String value) {
            addCriterion("userphone <=", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneLike(String value) {
            addCriterion("userphone like", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneNotLike(String value) {
            addCriterion("userphone not like", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneIn(List<String> values) {
            addCriterion("userphone in", values, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneNotIn(List<String> values) {
            addCriterion("userphone not in", values, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneBetween(String value1, String value2) {
            addCriterion("userphone between", value1, value2, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneNotBetween(String value1, String value2) {
            addCriterion("userphone not between", value1, value2, "userphone");
            return (Criteria) this;
        }

        public Criteria andUseraddressidIsNull() {
            addCriterion("useraddressid is null");
            return (Criteria) this;
        }

        public Criteria andUseraddressidIsNotNull() {
            addCriterion("useraddressid is not null");
            return (Criteria) this;
        }

        public Criteria andUseraddressidEqualTo(Integer value) {
            addCriterion("useraddressid =", value, "useraddressid");
            return (Criteria) this;
        }

        public Criteria andUseraddressidNotEqualTo(Integer value) {
            addCriterion("useraddressid <>", value, "useraddressid");
            return (Criteria) this;
        }

        public Criteria andUseraddressidGreaterThan(Integer value) {
            addCriterion("useraddressid >", value, "useraddressid");
            return (Criteria) this;
        }

        public Criteria andUseraddressidGreaterThanOrEqualTo(Integer value) {
            addCriterion("useraddressid >=", value, "useraddressid");
            return (Criteria) this;
        }

        public Criteria andUseraddressidLessThan(Integer value) {
            addCriterion("useraddressid <", value, "useraddressid");
            return (Criteria) this;
        }

        public Criteria andUseraddressidLessThanOrEqualTo(Integer value) {
            addCriterion("useraddressid <=", value, "useraddressid");
            return (Criteria) this;
        }

        public Criteria andUseraddressidIn(List<Integer> values) {
            addCriterion("useraddressid in", values, "useraddressid");
            return (Criteria) this;
        }

        public Criteria andUseraddressidNotIn(List<Integer> values) {
            addCriterion("useraddressid not in", values, "useraddressid");
            return (Criteria) this;
        }

        public Criteria andUseraddressidBetween(Integer value1, Integer value2) {
            addCriterion("useraddressid between", value1, value2, "useraddressid");
            return (Criteria) this;
        }

        public Criteria andUseraddressidNotBetween(Integer value1, Integer value2) {
            addCriterion("useraddressid not between", value1, value2, "useraddressid");
            return (Criteria) this;
        }

        public Criteria andUserfaceIsNull() {
            addCriterion("userface is null");
            return (Criteria) this;
        }

        public Criteria andUserfaceIsNotNull() {
            addCriterion("userface is not null");
            return (Criteria) this;
        }

        public Criteria andUserfaceEqualTo(String value) {
            addCriterion("userface =", value, "userface");
            return (Criteria) this;
        }

        public Criteria andUserfaceNotEqualTo(String value) {
            addCriterion("userface <>", value, "userface");
            return (Criteria) this;
        }

        public Criteria andUserfaceGreaterThan(String value) {
            addCriterion("userface >", value, "userface");
            return (Criteria) this;
        }

        public Criteria andUserfaceGreaterThanOrEqualTo(String value) {
            addCriterion("userface >=", value, "userface");
            return (Criteria) this;
        }

        public Criteria andUserfaceLessThan(String value) {
            addCriterion("userface <", value, "userface");
            return (Criteria) this;
        }

        public Criteria andUserfaceLessThanOrEqualTo(String value) {
            addCriterion("userface <=", value, "userface");
            return (Criteria) this;
        }

        public Criteria andUserfaceLike(String value) {
            addCriterion("userface like", value, "userface");
            return (Criteria) this;
        }

        public Criteria andUserfaceNotLike(String value) {
            addCriterion("userface not like", value, "userface");
            return (Criteria) this;
        }

        public Criteria andUserfaceIn(List<String> values) {
            addCriterion("userface in", values, "userface");
            return (Criteria) this;
        }

        public Criteria andUserfaceNotIn(List<String> values) {
            addCriterion("userface not in", values, "userface");
            return (Criteria) this;
        }

        public Criteria andUserfaceBetween(String value1, String value2) {
            addCriterion("userface between", value1, value2, "userface");
            return (Criteria) this;
        }

        public Criteria andUserfaceNotBetween(String value1, String value2) {
            addCriterion("userface not between", value1, value2, "userface");
            return (Criteria) this;
        }

        public Criteria andUserregdateIsNull() {
            addCriterion("userregdate is null");
            return (Criteria) this;
        }

        public Criteria andUserregdateIsNotNull() {
            addCriterion("userregdate is not null");
            return (Criteria) this;
        }

        public Criteria andUserregdateEqualTo(Date value) {
            addCriterion("userregdate =", value, "userregdate");
            return (Criteria) this;
        }

        public Criteria andUserregdateNotEqualTo(Date value) {
            addCriterion("userregdate <>", value, "userregdate");
            return (Criteria) this;
        }

        public Criteria andUserregdateGreaterThan(Date value) {
            addCriterion("userregdate >", value, "userregdate");
            return (Criteria) this;
        }

        public Criteria andUserregdateGreaterThanOrEqualTo(Date value) {
            addCriterion("userregdate >=", value, "userregdate");
            return (Criteria) this;
        }

        public Criteria andUserregdateLessThan(Date value) {
            addCriterion("userregdate <", value, "userregdate");
            return (Criteria) this;
        }

        public Criteria andUserregdateLessThanOrEqualTo(Date value) {
            addCriterion("userregdate <=", value, "userregdate");
            return (Criteria) this;
        }

        public Criteria andUserregdateIn(List<Date> values) {
            addCriterion("userregdate in", values, "userregdate");
            return (Criteria) this;
        }

        public Criteria andUserregdateNotIn(List<Date> values) {
            addCriterion("userregdate not in", values, "userregdate");
            return (Criteria) this;
        }

        public Criteria andUserregdateBetween(Date value1, Date value2) {
            addCriterion("userregdate between", value1, value2, "userregdate");
            return (Criteria) this;
        }

        public Criteria andUserregdateNotBetween(Date value1, Date value2) {
            addCriterion("userregdate not between", value1, value2, "userregdate");
            return (Criteria) this;
        }

        public Criteria andLandingtimesIsNull() {
            addCriterion("landingtimes is null");
            return (Criteria) this;
        }

        public Criteria andLandingtimesIsNotNull() {
            addCriterion("landingtimes is not null");
            return (Criteria) this;
        }

        public Criteria andLandingtimesEqualTo(Integer value) {
            addCriterion("landingtimes =", value, "landingtimes");
            return (Criteria) this;
        }

        public Criteria andLandingtimesNotEqualTo(Integer value) {
            addCriterion("landingtimes <>", value, "landingtimes");
            return (Criteria) this;
        }

        public Criteria andLandingtimesGreaterThan(Integer value) {
            addCriterion("landingtimes >", value, "landingtimes");
            return (Criteria) this;
        }

        public Criteria andLandingtimesGreaterThanOrEqualTo(Integer value) {
            addCriterion("landingtimes >=", value, "landingtimes");
            return (Criteria) this;
        }

        public Criteria andLandingtimesLessThan(Integer value) {
            addCriterion("landingtimes <", value, "landingtimes");
            return (Criteria) this;
        }

        public Criteria andLandingtimesLessThanOrEqualTo(Integer value) {
            addCriterion("landingtimes <=", value, "landingtimes");
            return (Criteria) this;
        }

        public Criteria andLandingtimesIn(List<Integer> values) {
            addCriterion("landingtimes in", values, "landingtimes");
            return (Criteria) this;
        }

        public Criteria andLandingtimesNotIn(List<Integer> values) {
            addCriterion("landingtimes not in", values, "landingtimes");
            return (Criteria) this;
        }

        public Criteria andLandingtimesBetween(Integer value1, Integer value2) {
            addCriterion("landingtimes between", value1, value2, "landingtimes");
            return (Criteria) this;
        }

        public Criteria andLandingtimesNotBetween(Integer value1, Integer value2) {
            addCriterion("landingtimes not between", value1, value2, "landingtimes");
            return (Criteria) this;
        }

        public Criteria andSlockIsNull() {
            addCriterion("slock is null");
            return (Criteria) this;
        }

        public Criteria andSlockIsNotNull() {
            addCriterion("slock is not null");
            return (Criteria) this;
        }

        public Criteria andSlockEqualTo(Integer value) {
            addCriterion("slock =", value, "slock");
            return (Criteria) this;
        }

        public Criteria andSlockNotEqualTo(Integer value) {
            addCriterion("slock <>", value, "slock");
            return (Criteria) this;
        }

        public Criteria andSlockGreaterThan(Integer value) {
            addCriterion("slock >", value, "slock");
            return (Criteria) this;
        }

        public Criteria andSlockGreaterThanOrEqualTo(Integer value) {
            addCriterion("slock >=", value, "slock");
            return (Criteria) this;
        }

        public Criteria andSlockLessThan(Integer value) {
            addCriterion("slock <", value, "slock");
            return (Criteria) this;
        }

        public Criteria andSlockLessThanOrEqualTo(Integer value) {
            addCriterion("slock <=", value, "slock");
            return (Criteria) this;
        }

        public Criteria andSlockIn(List<Integer> values) {
            addCriterion("slock in", values, "slock");
            return (Criteria) this;
        }

        public Criteria andSlockNotIn(List<Integer> values) {
            addCriterion("slock not in", values, "slock");
            return (Criteria) this;
        }

        public Criteria andSlockBetween(Integer value1, Integer value2) {
            addCriterion("slock between", value1, value2, "slock");
            return (Criteria) this;
        }

        public Criteria andSlockNotBetween(Integer value1, Integer value2) {
            addCriterion("slock not between", value1, value2, "slock");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}