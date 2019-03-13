package com.shopping.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class SPExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SPExample() {
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

        public Criteria andPidIsNull() {
            addCriterion("pid is null");
            return (Criteria) this;
        }

        public Criteria andPidIsNotNull() {
            addCriterion("pid is not null");
            return (Criteria) this;
        }

        public Criteria andPidEqualTo(Integer value) {
            addCriterion("pid =", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotEqualTo(Integer value) {
            addCriterion("pid <>", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThan(Integer value) {
            addCriterion("pid >", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThanOrEqualTo(Integer value) {
            addCriterion("pid >=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThan(Integer value) {
            addCriterion("pid <", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThanOrEqualTo(Integer value) {
            addCriterion("pid <=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidIn(List<Integer> values) {
            addCriterion("pid in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotIn(List<Integer> values) {
            addCriterion("pid not in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidBetween(Integer value1, Integer value2) {
            addCriterion("pid between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotBetween(Integer value1, Integer value2) {
            addCriterion("pid not between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andPnameIsNull() {
            addCriterion("pname is null");
            return (Criteria) this;
        }

        public Criteria andPnameIsNotNull() {
            addCriterion("pname is not null");
            return (Criteria) this;
        }

        public Criteria andPnameEqualTo(String value) {
            addCriterion("pname =", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameNotEqualTo(String value) {
            addCriterion("pname <>", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameGreaterThan(String value) {
            addCriterion("pname >", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameGreaterThanOrEqualTo(String value) {
            addCriterion("pname >=", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameLessThan(String value) {
            addCriterion("pname <", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameLessThanOrEqualTo(String value) {
            addCriterion("pname <=", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameLike(String value) {
            addCriterion("pname like", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameNotLike(String value) {
            addCriterion("pname not like", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameIn(List<String> values) {
            addCriterion("pname in", values, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameNotIn(List<String> values) {
            addCriterion("pname not in", values, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameBetween(String value1, String value2) {
            addCriterion("pname between", value1, value2, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameNotBetween(String value1, String value2) {
            addCriterion("pname not between", value1, value2, "pname");
            return (Criteria) this;
        }

        public Criteria andPpriceIsNull() {
            addCriterion("pprice is null");
            return (Criteria) this;
        }

        public Criteria andPpriceIsNotNull() {
            addCriterion("pprice is not null");
            return (Criteria) this;
        }

        public Criteria andPpriceEqualTo(Double value) {
            addCriterion("pprice =", value, "pprice");
            return (Criteria) this;
        }

        public Criteria andPpriceNotEqualTo(Double value) {
            addCriterion("pprice <>", value, "pprice");
            return (Criteria) this;
        }

        public Criteria andPpriceGreaterThan(Double value) {
            addCriterion("pprice >", value, "pprice");
            return (Criteria) this;
        }

        public Criteria andPpriceGreaterThanOrEqualTo(Double value) {
            addCriterion("pprice >=", value, "pprice");
            return (Criteria) this;
        }

        public Criteria andPpriceLessThan(Double value) {
            addCriterion("pprice <", value, "pprice");
            return (Criteria) this;
        }

        public Criteria andPpriceLessThanOrEqualTo(Double value) {
            addCriterion("pprice <=", value, "pprice");
            return (Criteria) this;
        }

        public Criteria andPpriceIn(List<Double> values) {
            addCriterion("pprice in", values, "pprice");
            return (Criteria) this;
        }

        public Criteria andPpriceNotIn(List<Double> values) {
            addCriterion("pprice not in", values, "pprice");
            return (Criteria) this;
        }

        public Criteria andPpriceBetween(Double value1, Double value2) {
            addCriterion("pprice between", value1, value2, "pprice");
            return (Criteria) this;
        }

        public Criteria andPpriceNotBetween(Double value1, Double value2) {
            addCriterion("pprice not between", value1, value2, "pprice");
            return (Criteria) this;
        }

        public Criteria andPimgIsNull() {
            addCriterion("pimg is null");
            return (Criteria) this;
        }

        public Criteria andPimgIsNotNull() {
            addCriterion("pimg is not null");
            return (Criteria) this;
        }

        public Criteria andPimgEqualTo(String value) {
            addCriterion("pimg =", value, "pimg");
            return (Criteria) this;
        }

        public Criteria andPimgNotEqualTo(String value) {
            addCriterion("pimg <>", value, "pimg");
            return (Criteria) this;
        }

        public Criteria andPimgGreaterThan(String value) {
            addCriterion("pimg >", value, "pimg");
            return (Criteria) this;
        }

        public Criteria andPimgGreaterThanOrEqualTo(String value) {
            addCriterion("pimg >=", value, "pimg");
            return (Criteria) this;
        }

        public Criteria andPimgLessThan(String value) {
            addCriterion("pimg <", value, "pimg");
            return (Criteria) this;
        }

        public Criteria andPimgLessThanOrEqualTo(String value) {
            addCriterion("pimg <=", value, "pimg");
            return (Criteria) this;
        }

        public Criteria andPimgLike(String value) {
            addCriterion("pimg like", value, "pimg");
            return (Criteria) this;
        }

        public Criteria andPimgNotLike(String value) {
            addCriterion("pimg not like", value, "pimg");
            return (Criteria) this;
        }

        public Criteria andPimgIn(List<String> values) {
            addCriterion("pimg in", values, "pimg");
            return (Criteria) this;
        }

        public Criteria andPimgNotIn(List<String> values) {
            addCriterion("pimg not in", values, "pimg");
            return (Criteria) this;
        }

        public Criteria andPimgBetween(String value1, String value2) {
            addCriterion("pimg between", value1, value2, "pimg");
            return (Criteria) this;
        }

        public Criteria andPimgNotBetween(String value1, String value2) {
            addCriterion("pimg not between", value1, value2, "pimg");
            return (Criteria) this;
        }

        public Criteria andPnumIsNull() {
            addCriterion("pnum is null");
            return (Criteria) this;
        }

        public Criteria andPnumIsNotNull() {
            addCriterion("pnum is not null");
            return (Criteria) this;
        }

        public Criteria andPnumEqualTo(Integer value) {
            addCriterion("pnum =", value, "pnum");
            return (Criteria) this;
        }

        public Criteria andPnumNotEqualTo(Integer value) {
            addCriterion("pnum <>", value, "pnum");
            return (Criteria) this;
        }

        public Criteria andPnumGreaterThan(Integer value) {
            addCriterion("pnum >", value, "pnum");
            return (Criteria) this;
        }

        public Criteria andPnumGreaterThanOrEqualTo(Integer value) {
            addCriterion("pnum >=", value, "pnum");
            return (Criteria) this;
        }

        public Criteria andPnumLessThan(Integer value) {
            addCriterion("pnum <", value, "pnum");
            return (Criteria) this;
        }

        public Criteria andPnumLessThanOrEqualTo(Integer value) {
            addCriterion("pnum <=", value, "pnum");
            return (Criteria) this;
        }

        public Criteria andPnumIn(List<Integer> values) {
            addCriterion("pnum in", values, "pnum");
            return (Criteria) this;
        }

        public Criteria andPnumNotIn(List<Integer> values) {
            addCriterion("pnum not in", values, "pnum");
            return (Criteria) this;
        }

        public Criteria andPnumBetween(Integer value1, Integer value2) {
            addCriterion("pnum between", value1, value2, "pnum");
            return (Criteria) this;
        }

        public Criteria andPnumNotBetween(Integer value1, Integer value2) {
            addCriterion("pnum not between", value1, value2, "pnum");
            return (Criteria) this;
        }

        public Criteria andPcdateIsNull() {
            addCriterion("pcdate is null");
            return (Criteria) this;
        }

        public Criteria andPcdateIsNotNull() {
            addCriterion("pcdate is not null");
            return (Criteria) this;
        }

        public Criteria andPcdateEqualTo(Date value) {
            addCriterionForJDBCDate("pcdate =", value, "pcdate");
            return (Criteria) this;
        }

        public Criteria andPcdateNotEqualTo(Date value) {
            addCriterionForJDBCDate("pcdate <>", value, "pcdate");
            return (Criteria) this;
        }

        public Criteria andPcdateGreaterThan(Date value) {
            addCriterionForJDBCDate("pcdate >", value, "pcdate");
            return (Criteria) this;
        }

        public Criteria andPcdateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("pcdate >=", value, "pcdate");
            return (Criteria) this;
        }

        public Criteria andPcdateLessThan(Date value) {
            addCriterionForJDBCDate("pcdate <", value, "pcdate");
            return (Criteria) this;
        }

        public Criteria andPcdateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("pcdate <=", value, "pcdate");
            return (Criteria) this;
        }

        public Criteria andPcdateIn(List<Date> values) {
            addCriterionForJDBCDate("pcdate in", values, "pcdate");
            return (Criteria) this;
        }

        public Criteria andPcdateNotIn(List<Date> values) {
            addCriterionForJDBCDate("pcdate not in", values, "pcdate");
            return (Criteria) this;
        }

        public Criteria andPcdateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("pcdate between", value1, value2, "pcdate");
            return (Criteria) this;
        }

        public Criteria andPcdateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("pcdate not between", value1, value2, "pcdate");
            return (Criteria) this;
        }

        public Criteria andPclicksIsNull() {
            addCriterion("pclicks is null");
            return (Criteria) this;
        }

        public Criteria andPclicksIsNotNull() {
            addCriterion("pclicks is not null");
            return (Criteria) this;
        }

        public Criteria andPclicksEqualTo(Integer value) {
            addCriterion("pclicks =", value, "pclicks");
            return (Criteria) this;
        }

        public Criteria andPclicksNotEqualTo(Integer value) {
            addCriterion("pclicks <>", value, "pclicks");
            return (Criteria) this;
        }

        public Criteria andPclicksGreaterThan(Integer value) {
            addCriterion("pclicks >", value, "pclicks");
            return (Criteria) this;
        }

        public Criteria andPclicksGreaterThanOrEqualTo(Integer value) {
            addCriterion("pclicks >=", value, "pclicks");
            return (Criteria) this;
        }

        public Criteria andPclicksLessThan(Integer value) {
            addCriterion("pclicks <", value, "pclicks");
            return (Criteria) this;
        }

        public Criteria andPclicksLessThanOrEqualTo(Integer value) {
            addCriterion("pclicks <=", value, "pclicks");
            return (Criteria) this;
        }

        public Criteria andPclicksIn(List<Integer> values) {
            addCriterion("pclicks in", values, "pclicks");
            return (Criteria) this;
        }

        public Criteria andPclicksNotIn(List<Integer> values) {
            addCriterion("pclicks not in", values, "pclicks");
            return (Criteria) this;
        }

        public Criteria andPclicksBetween(Integer value1, Integer value2) {
            addCriterion("pclicks between", value1, value2, "pclicks");
            return (Criteria) this;
        }

        public Criteria andPclicksNotBetween(Integer value1, Integer value2) {
            addCriterion("pclicks not between", value1, value2, "pclicks");
            return (Criteria) this;
        }

        public Criteria andPtypeidIsNull() {
            addCriterion("ptypeid is null");
            return (Criteria) this;
        }

        public Criteria andPtypeidIsNotNull() {
            addCriterion("ptypeid is not null");
            return (Criteria) this;
        }

        public Criteria andPtypeidEqualTo(Integer value) {
            addCriterion("ptypeid =", value, "ptypeid");
            return (Criteria) this;
        }

        public Criteria andPtypeidNotEqualTo(Integer value) {
            addCriterion("ptypeid <>", value, "ptypeid");
            return (Criteria) this;
        }

        public Criteria andPtypeidGreaterThan(Integer value) {
            addCriterion("ptypeid >", value, "ptypeid");
            return (Criteria) this;
        }

        public Criteria andPtypeidGreaterThanOrEqualTo(Integer value) {
            addCriterion("ptypeid >=", value, "ptypeid");
            return (Criteria) this;
        }

        public Criteria andPtypeidLessThan(Integer value) {
            addCriterion("ptypeid <", value, "ptypeid");
            return (Criteria) this;
        }

        public Criteria andPtypeidLessThanOrEqualTo(Integer value) {
            addCriterion("ptypeid <=", value, "ptypeid");
            return (Criteria) this;
        }

        public Criteria andPtypeidIn(List<Integer> values) {
            addCriterion("ptypeid in", values, "ptypeid");
            return (Criteria) this;
        }

        public Criteria andPtypeidNotIn(List<Integer> values) {
            addCriterion("ptypeid not in", values, "ptypeid");
            return (Criteria) this;
        }

        public Criteria andPtypeidBetween(Integer value1, Integer value2) {
            addCriterion("ptypeid between", value1, value2, "ptypeid");
            return (Criteria) this;
        }

        public Criteria andPtypeidNotBetween(Integer value1, Integer value2) {
            addCriterion("ptypeid not between", value1, value2, "ptypeid");
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